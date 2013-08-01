package 
{

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.utils.*;
	import flash.geom.Point;
	import flash.globalization.LastOperationStatus;
	import flash.system.*;
	import flash.display.Stage;

	public class Game extends MovieClip
	{

		//Entities
		private var bg:LevelBackground;
		private var bg2:LevelBackground;
		private var dragonPicker:LevelDragonPicker;
		private var ground:LevelGround;
		private var ground2:LevelGround;
		private static var player:Player;
		private var dragonStills:DragonStills;
		private var enemies:Array = new Array  ;
		private var obstacles:Array = new Array  ;

		//Game Variables
		private var stageRef:Stage;
		private var key:KeyObject;
		private static var acceleration:Boolean = false;
		private static var speed = 4;
		private const MAX_SPEED = 6;
		private var count:int = 0;
		private var i:int = 0;
		private var gravity = 1;
		private var shouldStop:Boolean = false;
		
		//Menu Variables
		private var mainmenu;
		private var endmenu;

		public function Game()
		{
			
			startMenu();
			
			
		}
		
		function startMenu()
		{
			stageRef = stage;
			mainmenu = new Menu();
			//The button position is relative to the origin of the menu.
			mainmenu.addButton("Start", levelOne, 300, -250);
			mainmenu.addButton("Options", levelOne, 300, -100);
			stage.addChild(mainmenu);
		}
		
		function endScreen()
		{
			stageRef = stage;
			endmenu = new Menu();
			endmenu.addButton("Back to Menu", startMenu, 300, -200);
			stage.addChild(endmenu);
		}
		
		function bossLevel()
		{
			stageRef=stage;
			
		}
		function levelOne()
		{
			stageRef=stage;
			ground = new LevelGround(0,370);
			ground2 = new LevelGround(ground.width,370);
			dragonPicker = new LevelDragonPicker(0,400);
			bg = new LevelBackground(0,0);
			bg2 = new LevelBackground(bg.width,0);
			player = new Player(25,380,stageRef);//380
			
			key = new KeyObject(stageRef);
			var playerHeight=player.getHeight();

			enemies[0] = new FlyingEnemy(1200,325 - playerHeight);
			enemies[1] = new Enemy(1800,370);
			enemies[2] = new FlyingEnemy(2000,325 -playerHeight);
			enemies[3] = new Enemy(2400,370);
			enemies[4] = new Enemy(2900,370);
			enemies[5] = new FlyingEnemy(3000,325 - playerHeight);
			enemies[6] = new Enemy(3500,370);
			enemies[7] = new Enemy(3900,370);
			enemies[8] = new FlyingEnemy(4200,325 - playerHeight);
			enemies[9] = new Enemy(4400,370);
			enemies[10] = new FlyingEnemy(4600,325 - playerHeight);
			enemies[11] = new FlyingEnemy(5100,325 - playerHeight);
			enemies[12] = new FlyingEnemy(5200,325 - playerHeight);
			enemies[13] = new Enemy(5300,370);
			enemies[14] = new FlyingEnemy(5500,325 - playerHeight);
			enemies[15] = new Enemy(5700,370);

			obstacles[0] = new Obstacle(2100,400);
			obstacles[1] = new Obstacle(1000,400);
			obstacles[2] = new Obstacle(4000,400);
			obstacles[3] = new Obstacle(3000,400);
			obstacles[4] = new Obstacle(900,400);
			obstacles[5] = new Obstacle(1600,400);
			obstacles[6] = new Obstacle(4200,400);
			obstacles[7] = new Obstacle(6000,400);

			//adding to stage
			this.addChild(bg);
			this.addChild(bg2);
			this.addChild(dragonPicker);
			this.addChild(ground);
			this.addChild(ground2);
			this.addChild(player);
			for (var i:int = 0; i < obstacles.length; i++)
			{

				this.addChild(obstacles[i]);

			}
			for (i = 0; i < enemies.length; i++)
			{
				this.addChild(enemies[i]);
				enemies[i].gotoAndStop("Alive");
			}
			this.addChild(player.getPlayerDragon());
			player.getPlayerDragon().gotoAndStop("DragonIdle");

			addEventListener(Event.ENTER_FRAME,loop2,false,0,true);
		}

		function loop2(e:Event):void
		{
			if(bg.getX() < -5000)
			{
				removeEventListener(Event.ENTER_FRAME, loop2, false);
				clearStage();
				//Bullets can continue to be fired, but everything else is removed.
				endScreen();
				return;
			}
			//trace(bg.getX());
			stage.addEventListener(KeyboardEvent.KEY_DOWN,kdown);
			checkJump();

			//check for collisions
			
			if (!player.getHitObstacle()&&(acceleration && speed != MAX_SPEED))
			{
				speed = speed * 1.01;
				if ((speed > MAX_SPEED))
				{
					acceleration = false;
				}
			}

			//move all the other things
			if (! shouldStop)
			{ 
				bg.setX(bg.getX()-speed);
				bg2.setX(bg2.getX()-speed);
				ground.setX(ground.getX()-speed);
				ground2.setX(ground2.getX()-speed);
				for (i = 0; i < enemies.length; i++)
				{
					enemies[i].setX(enemies[i].getX()-speed);
				}
				for (i = 0; i < obstacles.length; i++)
				{
					obstacles[i].setX(obstacles[i].getX()-speed);
				}

				//loop background
				if (bg.getX() < bg.getWidth() * -1)
				{
					bg.setX(bg2.getWidth()-50);
					ground.setX(ground.getWidth()-50);
				}
				if (bg2.getX() < bg2.getWidth() * -1)
				{
					bg2.setX(bg2.getWidth()-50);
					ground2.setX(ground2.getWidth()-50);
				}
			}

			if (player.getX() < 100)
			{
				player.setX(player.getX()+speed);
			}
			else if (player.getX() < 105)
			{
				player.setX(player.getX()+speed/2);
			}
			else
			{

			}
			player.getPlayerDragon().setX(player.getX()+100);
			if (player.getX() < 105)
			{
				shouldStop = true;
			}
			else
			{
				shouldStop = false;
			}
		}
		//GETTER FUNCTIONS
		public function getBG1()
		{
			return this.bg;
		}
		public function getBG2()
		{
			return this.bg2;
		}
		public static function setAcceleration(arg:Boolean)
		{
			acceleration=arg;
		}
		public static function setSpeed(arg:int)
		{
			speed=arg;
		}
		public function getDragonPicker()
		{
			return this.dragonPicker;
		}
		public function getGround1()
		{
			return this.ground;
		}
		public function getGround2()
		{
			return this.ground2;
		}
		public static function getPlayer()
		{
			return player;
		}
		public function getEnemyArray()
		{
			return this.enemies;
		}
		public function getObstacleArray()
		{
			return this.obstacles;
		}

		function checkJump()
		{
			if (player.getIsJumping())
			{
				player.setJumpSpeed(player.getJumpSpeed()+gravity);
				player.setY(player.getY()+player.getJumpSpeed());
				//each time y changes, jump speed decreases
				player.getPlayerDragon().setY(player.getPlayerDragon().getY()+player.getJumpSpeed());
				if (player.getY() >= 380)
				{
					player.setIsJumping(false);
					player.setY(380);
					player.getPlayerDragon().setY(200);
					player.setJumpSpeed(-20);
				}
			}
		}

		public function kdown(e:KeyboardEvent)
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				for (var i:int = 0; i < enemies.length; i++)
				{
					if (! enemies[i].getIsDead() && enemies[i].getX() < 800 && enemies[i].getX() > player.getX())
					{
						player.getPlayerDragon().shoot(enemies[i]);
						break;
					}
				}

			}
			if (e.keyCode == Keyboard.W)
			{
				player.setIsJumping(true);
				player.setReachedPeak(false);
			}

		}

		public static function checkSide(target:Entity, otherTarget:Entity)
		{
			var points:Array = new Array  ;
			var t:int = 0;
			var i:int = 0;
			//Top
			for (i = target.getX() + 6; i < target.getX() + target.getWidth() - 6; i +=  2,t++)
			{
				points[t] = new EntityPoint(i,target.getY() - target.getHeight(),"top");
			}
			//Left
			for (i = target.getY() - 6; i > target.getY() - target.getHeight() + 6; i -=  2,t++)
			{
				points[t] = new EntityPoint(target.getX(),i,"left");
			}//Bottom
			for (i = target.getX() + 6; i < target.getX() + target.getWidth() - 6; i +=  2,t++)
			{
				points[t] = new EntityPoint(i,target.getY(),"bottom");
			}

			for each (var p:EntityPoint in points)
			{
				if (otherTarget.hitTestPoint(p.x,p.y))
				{

					return p.side;
				}
			}
			return "empty";
		}

		public static function checkIfHit(target:Entity, otherTarget:Entity)
		{
			if (otherTarget.hitTestObject(target) && ! otherTarget.getInCollision())
			{
				var side:String;
				side=checkSide(target,otherTarget);
				trace(side);
				if ((side == "left"))
				{
					otherTarget.setX(target.getX()-otherTarget.getWidth());
					otherTarget.setHitObstacle(true);
					otherTarget.setInCollision(true);
				}
				else if ((side == "bottom"))
				{
					otherTarget.setY(otherTarget.getHeight()+target.getY());
					otherTarget.setHitObstacle(true);
					otherTarget.setInCollision(true);

				}
				if ((side == "top"))
				{
					otherTarget.setY(target.getY()-target.getHeight());
					otherTarget.setInCollision(false);
					otherTarget.setIsJumping(false);
					otherTarget.setJumpSpeed(-20);
				}
				if ((side == "empty"))
				{
					otherTarget.setIsJumping(true);
					otherTarget.setJumpSpeed(0);
					otherTarget.setInCollision(false);
				}
			}
		}
		
		public function clearStage()
		{
			//trace("1");
			this.removeChild(bg);
			//trace("2");
			this.removeChild(bg2);
			//trace("3");
			this.removeChild(dragonPicker);
			//trace("4");
			this.removeChild(ground);
			//trace("5");
			this.removeChild(ground2);
			//trace("6");
			this.removeChild(player);
			for (var i:int = 0; i < obstacles.length; i++)
			{
				//trace("Obstacles" + i);
				this.removeChild(obstacles[i]);

			}
			//The attempt to remove enemies causes the game to break.
			/*for (i = 0; i < enemies.length; i++)
			{
				trace("Enemies" + i);
				this.removeChild(enemies[i]);
				enemies[i].gotoAndStop("Alive");
				//enemies[i] = null;				
			}*/
			//trace("7");
			removeChild(player.getPlayerDragon());
			player.getPlayerDragon().gotoAndStop("DragonIdle");
		}
	}
}