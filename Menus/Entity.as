package 
{

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.Point;
	import flash.events.*;

	public class Entity extends MovieClip
	{

		public var leftPoint:Point;
		public var rightPoint:Point;
		public var topPoint:Point;
		public var bottomPoint:Point;
		public var triggered = false;
		private var hitObstacle:Boolean = false;
		private var inCollision:Boolean = false;
		private var isJumping:Boolean = false;
		private var reachedPeak:Boolean = true;
		private var jumpSpeed = -20;

		public function Entity(x,y)
		{
			this.x = x;
			this.y = y;
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		public function getX()
		{
			return this.x;
		}
		public function setX(x)
		{
			this.x = x;
		}
		public function getY()
		{
			return this.y;
		}
		public function setY(y)
		{
			this.y = y;
		}
		public function getWidth()
		{
			return this.width;
		}
		public function getHeight()
		{
			return this.height;
		}
		public function getInCollision()
		{
			return inCollision;
		}
		public function setInCollision(arg:Boolean)
		{
			this.inCollision = arg;
		}
		public function getHitObstacle()
		{
			return this.hitObstacle;
		}
		public function setHitObstacle(arg:Boolean)
		{
			this.hitObstacle = arg;
		}
		public function getIsJumping()
		{
			return isJumping;
		}
		public function setIsJumping(arg:Boolean)
		{
			this.isJumping = arg;
		}
		public function getReachedPeak()
		{
			return reachedPeak;
		}
		public function setReachedPeak(arg:Boolean)
		{
			this.reachedPeak = arg;
		}
		public function getJumpSpeed()
		{
			return this.jumpSpeed;
		}
		public function setJumpSpeed(arg:int)
		{
			this.jumpSpeed = arg;
		}
		function loop(e:Event)
		{
			leftPoint= new Point(this.x, (this.y-(this.height/2)));
			rightPoint=new Point (this.x+this.width, this.y-(this.height/2));
			topPoint= new Point(this.x+(this.width/2), this.y-this.height);
			bottomPoint=new Point(this.x+(this.width/2), this.y);

		}

	}

}