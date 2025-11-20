# PlannerProject
ProiectFinal

Acestea sunt instructiunile pentru proiectul final al cursului.

Pentru a rula proiectul, urmați pașii de mai jos:

1. Trebuie creata o baza de date MySQL numita "planner".
2. Rulați scriptul SQL din fișierul `planner.sql` pentru a crea tabelele necesare.
3. Configurați conexiunea la baza de date:
    - Din db/session.py, actualizați variabilele de conexiune la baza de date:
   mysql://root:1Q2w3E4r5T@host.docker.internal:3306/planner
    - Modificați variabilele `$host`, `$username`, `$password` cu informațiile corespunzătoare bazei dvs. de date.
    - Asigurați-vă că serverul MySQL este pornit și accesibil.
4. Rulați aplicația:
    - Deschideți terminalul și navigați la directorul proiectului.
    - Rulați comanda docker-compose build pentru a construi imaginile Docker.
    - Rulați comanda docker-compose up pentru a porni containerele Docker.
    - Accesați aplicația în browser la adresa http://localhost:8501.

5. Utilizați aplicația pentru a gestiona planificarea sarcinilor și evenimentelor.