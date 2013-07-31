package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.Event;
	
	public class Player extends Entity{
		
		var velocity:Number;
		
		public function Player(x, y) {
			super(x, y);
			
			velocity = 10
			addEventListener("enterFrame", move);
		}
		function move (e:Event){
			if(Key.isDown(Keyboard.RIGHT)){
				this.x +=velocity;
			}
			if(Key.isDown(Keyboard.LEFT)){
				this.x -= velocity;
			}
			if(this.x< 0)
				this.x = 0;
		}
		

	}
	
}
