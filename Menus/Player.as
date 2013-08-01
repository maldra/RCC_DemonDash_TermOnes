package 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.utils.*;
	import flash.geom.Point;
	import flash.globalization.LastOperationStatus;
	import flash.system.*;

	public class Player extends Entity
	{
		
		private var playerDragon:Dragon;
		private var hitAni = null;
		public function Player(x,y,stageRef:Stage)
		{
			super(x,y);
			playerDragon = new Dragon(130,200,stageRef);
			addEventListener(Event.ENTER_FRAME,loop3, false, 0, true )
		}
		public function loop3(e:Event)
		{
			if (this.getHitObstacle())
			{
				Game.setSpeed(0);
				this.gotoAndStop("Trip");
				this.getPlayerDragon().gotoAndStop("DragonTrip");
				hitAni = this.getChildAt(0);

				if (hitAni.currentFrame == hitAni.totalFrames)
				{
					Game.setAcceleration(true);
					Game.setSpeed(1);
					this.setHitObstacle(false);
					this.setInCollision(false);
					this.setX(this.getX()-160);
					this.gotoAndStop("Idle");
					this.getPlayerDragon().gotoAndStop("DragonIdle");
				}
			}
		}
		public function getPlayerDragon()
		{
			return this.playerDragon;
		}
		public function setPlayerDragon(arg:Dragon)
		{
			this.playerDragon=arg;
		}
	}

}