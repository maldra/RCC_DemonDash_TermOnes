package  {
	
	import flash.display.MovieClip;
	
	public class Main extends MovieClip{
		
		var player : Player;
		var dragon : Dragon;
		var bg : Background;
		var db : DragonBar;
		var dbb : DBButton;
		var ground : Ground;
		var obstacle : Obstacle;
		var enemy : Enemy;

		public function Main() {
			// constructor code
			bg = new Background();
			player = new Player(67, 476);
			dragon = new Dragon(67, 476 - 271);
			db = new DragonBar();
			dbb = new DBButton(640, 700);
			ground = new Ground();
			obstacle = new Obstacle(927, 476);
			enemy = new Enemy(753, 280);
			
			stage.addChild(bg);
			stage.addChild(ground);
			stage.addChild(obstacle);
			stage.addChild(enemy);
			stage.addChild(dragon);
			stage.addChild(player);
			stage.addChild(db);
			stage.addChild(dbb);
		}

	}
	
}
