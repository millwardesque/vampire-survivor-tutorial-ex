# Survivors Game EX
An extension of the [GDQuest Vampire Survivor Game tutorial](https://www.youtube.com/watch?v=GwCiGixlqiU)

The intent here is to add small, proof-of-concept implementations of basic stuff that most games
have to the excellent tutorial already included in the base tutorial.

# Feature TODO
* Game reset from Game-over screen
	* ~~Button to trigger reset~~
	* Reset function
		* ~~Hide Game-over screen~~
		* ~~Unpause game~~
		* ~~Delete all mobs~~
		* ~~Create reset-game signal~~
		* ~~Move enemy-reset to Enemies container and process reset-game signal~~
		* ~~Reset player health~~
		* Try calling get_tree().reset_scene() instead of all that earlier stuff
		* Reset player position		
		* Reset timers
	* Remove hardcoded player node path from Mob.gd
	
* Score for enemies killed
* High-score table
* Game start screen
* Game pause
* Persistent high-score
* Sound FX
* Music
* Temporary power-ups
* Controller support
* A new kind of enemy. Projectile firing?
* A new kind of gun. Area-of-effect?
* Environmental hazard
* Theme
* A second level
* Juice (particles, camera-shake, etc.)
