from contextlib import contextmanager
from typing import Iterator
from sqlalchemy import create_engine
from sqlalchemy.orm import Session, sessionmaker
from logger import logger

SessionFactory = sessionmaker(
    bind=create_engine('mysql://root:1Q2w3E4r5T@host.docker.internal:3306/planner'),
    autocommit=False,
    autoflush=False,
    expire_on_commit=False,
)

def create_session() -> Iterator[Session]:
    logger.debug("Creating session Factory")
    session = SessionFactory()
    try:
        yield session
        logger.debug("Committing session")
        session.commit()
    except Exception as e:
        logger.error(e)
        logger.warning("Rollbacking session")
        session.rollback()
        logger.warning("Rollbacked session")
        raise
    finally:
        logger.debug("Closing session")
        session.close()
        logger.debug("Closed session")

@contextmanager
def open_session() -> Iterator[Session]:
    logger.debug("Returning session")
    return create_session()
