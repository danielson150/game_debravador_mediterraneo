extends KinematicBody2D # KinematicBody serve como um corpo que interage com o ambiente
class_name Actor # define uma classe para que possa ser extendida com o nome Actor

export var speed: = Vector2(150.0, 300.0) # Velocidade do jogador
export var gravity: = 1000.0 # Gravidade aplicada a queda
var _velocity: = Vector2.ZERO # Velocidade inicial (Controle da posição do player)
const FLOOR_NORMAL: = Vector2.UP # Serve para informar a engine que e um jogo de plataforma e o chão fica abaixo
