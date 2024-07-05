import pygame
from sys import exit
import random 
import math


# Initialize Pygame
pygame.init()



# Set up the display window
screen = pygame.display.set_mode((800, 600))

# Sets the background pic for the pyGame
background = pygame.image.load('Images/backgroundPic.jpg')
# Sets the icon as well caption for Pygame
pygame.display.set_caption("SpaceShip Battlez")
icon = pygame.image.load('Images/battleship.png')
pygame.display.set_icon(icon)

# Load player image and set initial position
playerImg = pygame.image.load('Images/arcade-game.png')
# Coordinates for player position
playerX = 370
playerY = 480
# Changes the X,Y coordinates for character
playerX_coor_change = 0 
playerY_coor_change = 0

# Loads the character image for the enemy
enemyPlayerImg = pygame.image.load('Images/monster.png')
# Coordinates for enemy character position
enemy_playerX = random.randint(0, 800) 
enemy_playerY = random.randint(50,150)
# Changes the X,Y coordinates for character enemy
enemyX_coor_change = 0.3
enemyY_coor_change = 40

# Loads the bullet image for spaceship
bulletIMG = pygame.image.load('Images/bullet.png')
# Coordinates for bullet position
bullet_X = 0
# Set to the Y value of the space ship
bullet_Y = 480
# Changes the X,Y coordinates for bullet
bulletX_coor_change = 0 
bulletY_coor_change = 0.6
# Shootin - bullet is active
# Passive - bullet is non-active
bullet_position = "Passive"

score = 0

# Function to draw the player character
def player_char(x, y):
    screen.blit(playerImg, (x, y))

# Enemy character function to draw enemy
def enemy_char(x,y):
    screen.blit(enemyPlayerImg,(x,y))

# Bullet function to draw the bullet to the Pygame
def bullet_char(x,y):
    global bullet_position
    bullet_position = "Shootin"
    # Draws the bullet image to the screen
    screen.blit(bulletIMG,(x + 16, y + 10))

# fuction whethere collision between enemy happened
def isCollision(enemy_playerX, enemy_playerY,bullet_X, bullet_Y):
   distance = math.sqrt((math.pow(enemy_playerX - bullet_X,2)) + (math.pow(enemy_playerY - bullet_Y, 2)))
   if distance > 27:
    return True
   else:
    return False

# Main game loop
while True:
    # Sets the screen of PyGame to RGB color
    screen.fill((0, 0, 0))
    # Background Image of Pygame
    screen.blit(background, (0,0))

    # Event are user Input controls
    # For loops iterates through different events within pYgme 
    for event in pygame.event.get():
        # Condition for if type of event = pygame.Quit pyGame screen quits
        if event.type == pygame.QUIT:
            exit()
        # Condition for user Input keystroke moving right or left
        if event.type == pygame.KEYDOWN:
            # Checks whether keystroke is right or left
            if event.key == pygame.K_LEFT:
                # Coordinate of character moves 0.1 to the left 
                print("Left key was pressed")
                # Player X coordinates change by -0.1
                playerX_coor_change = -0.4
            if event.key == pygame.K_RIGHT:
                # Coordinate of character moves 0.1 to the right
                print("Right key was pressed")
                # Player X coordinates change by 0.1
                playerX_coor_change = 0.4
            if event.key == pygame.K_SPACE:
                # When space bar is pressed bullet function is activated
                print("The space bar has been pressed")
                bullet_char(playerX,bullet_Y)


        # Checks if the key pressed has been unpressed
        if event.type == pygame.KEYUP:
            # Checks whetherright or left key was lifted
            if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                print("Right or Left key has been lifted")
                # Player X coordinates changes to 0 when key is released
                playerX_coor_change = 0


    # Player X add and is assigned player X's coordinate change values             
    playerX += playerX_coor_change 
    # Checks if Player X is goin out of Bounds
    if playerX >= 736:
        playerX = 736
    elif playerX <= 0:
        playerX = 0

    # Player X add and is assigned player X's coordinate change values             
    enemy_playerX += enemyX_coor_change 
    # Checks if Player X is goin out of Bounds
    if enemy_playerX <= 0:
        # When enemy character hits out of bouds range enemy coordinates move in opposite direction
       enemyX_coor_change = 0.45
       enemy_playerY += enemyY_coor_change
    elif enemy_playerX >= 736:
        # When enemy character hits out of bouds range enemy coordinates move in opposite direction
        enemyX_coor_change = -0.45
        enemy_playerY += enemyY_coor_change


    # Bullet Movement Condition
    # Bullet stays in boun of the pyGame 
    if bullet_Y <= 0:
        bullet_Y = 480
        bullet_position = "Shootin"
    # If bullet position is shootin bullet fires
    if bullet_position is "Shootin":
        bullet_char(playerX, bullet_Y)
        bullet_Y -= bulletY_coor_change


    # Collision
    collision = isCollision(enemy_playerX,enemy_playerY, bullet_X,bullet_Y)    
    if collision:
        bullet_Y = 480
        bullet_position = "Passive"
        score += 1
        print(score)
        enemy_playerX = random.randint(0, 800) 
        enemy_playerY = random.randint(50,150)


    # function that draws player character onto the Pygame screen
    player_char(playerX, playerY)
    enemy_char(enemy_playerX, enemy_playerY)


    # Update the display of the pyGame 
    pygame.display.update()
