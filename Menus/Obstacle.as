package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Obstacle extends Entity {

		public function Obstacle(x,y) {
			super(x,y);
			addEventListener(Event.ENTER_FRAME, loop2, false, 0, true);
		}
		function loop2(e:Event)
		{
			Game.checkIfHit(this, Game.getPlayer());
			
		}
	
	}
	
}
