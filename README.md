# Fredj_Lab2
# Lab 2: “Let’s count stuff” 

# **Introduction**

Le but de ce Lab est d'implémenter un compteur utilisant un timer sur 3 afficheurs
7-segments qui comptera de 0 à 999 pour chaque seconde avec une interruption du timer.


# **Architecture**

dans l'architecture du "Platform designer", j'ai commencé avec les composants de base (NIOS 2, RAM, Jtag UART pour le débogage) un PIO de 12 bits (qui commandera les 3 afficheurs 7-segments en utilisant 4 bits pour chacun) et un timer réglé sur 1 seconde qui déclenchera une interruption toutes les 1 seconde indiquant l'incrément du compteur.


Cette figure représente les différents composants de l'architecture et la manière dont ils seront connectés.
![image](https://user-images.githubusercontent.com/84923813/213004253-862dbd1a-12e8-48bc-9101-8c72d58e70ed.png)



Ici il y a le cablage l'architecture sur "Platform designer" et les priorités d'interruptions.
![image](https://user-images.githubusercontent.com/84923813/213005179-98ce1dd5-8763-45f5-bfbd-dc5cfe619c17.png)

# **Progrès**

Tout d'abord, dans mes premiers commits, j'ai implémenté un simple compteur sur un 7-segment.
après j'ai essayé le même compteur mais pour 3 affichages. Ici, j'ai eu le problème que je dois convertir le binaire en BCD et pour cela j'ai écrit une fonction de conversion BCD dans le fichier main.c. 
Et dans mes derniers commits, j'ai fait fonctionner le compteur avec l'interruption venant du compteur toutes les 1 seconde.

Au niveau matériel rien de bien important n'a changé, mais au niveau logiciel j'ai dû adapter le programme principal pour qu'il interrompe la fonction principale toutes les secondes afin de réaliser le comptage et la conversion BCD.

Cette vidéo montre comment le compteur fonctionne et comment le fait d'appuyer sur le bouton de reset le remet à zéro.

https://user-images.githubusercontent.com/84923813/213008205-4a3d5f47-8364-4b02-94fa-415f138bb5ee.mp4

# **Conclusion**

Ce lab a été utile, notamment pour comprendre l'utilisation du Timer ainsi que le concept d'utilisation des différents afficheur à 7 segments.
