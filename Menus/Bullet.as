package 
{

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Stage;
	import flash.utils.*;

	public class Bullet extends Entity
	{

		private var target1:Enemy;
		private var stageRef:Stage;
		private var gravity:Number = 1;
		private var xVelocity:Number = 60;
		private var yVelocity:Number = 30;
		private var speedx:Number = xVelocity * Math.cos(Math.PI / 180);
		private var speedy:Number = yVelocity * Math.sin(Math.PI / 180);
		private var bulletSpeed = -1;
		private var initialY:Number = 0;
		private var initialX:Number = 0;
		private var moveX:Number=0;
		private var moveY:Number=0;

		public function Bullet(x,y,target,stageRef)
		{
			super(x,y);
			initialX = x;
			initialY = y;
			this.target1 = target;
			this.stageRef = stageRef;

			addEventListener(Event.ENTER_FRAME, loop2, false, 0, true);

		}
		function loop2(e:Event)
		{
			if (! this.hitTestObject(target1)&&this.x<target1.getX())
			{
				var cy:Number = target1.getY()- this.y;
				trace(cy);
				var cx:Number = target1.getX()-this.x;
				trace(cx);
				var angle:Number = Math.atan2(cy,cx);
				moveX = Math.cos(angle);
				moveY = Math.sin(angle);
				rotation = angle * 180 / Math.PI;
				
				if (this.y>target1.getY()-target1.getHeight())
				{
					this.x +=  moveX*(speedx / 5);
					this.y +=  moveY*(speedy);
					speedy -=  gravity / 5;
				}
				
				else
				{
					this.x +=  moveX*(speedx / 5);
					this.y -=  moveY*(speedy);
					speedy -=  gravity / 5;
					
				}
			}
			else
			{
				target1.takeDamage(1);
				this.removeSelf();
			}


		}
		function removeSelf()
		{
			
			removeEventListener(Event.ENTER_FRAME, loop2);
			this.parent.removeChild(this);

		}
		
	}

}