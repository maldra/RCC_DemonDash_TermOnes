package 
{

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.Point;

	public class Enemy extends Entity
	{

		private var health:int = 1;
		private var isDead:Boolean = false;
		public function Enemy(x,y)
		{
			super(x,y);
			this.name = "Enemy";
			addEventListener(Event.ENTER_FRAME, loop2, false, 0, true);
		}
		function loop2(e:Event)
		{
			if (this.health == 0)
			{
				this.isDead = true;
				this.removeSelf();
			}
			else if (this.health<2&& this.health>=1)
			{
				this.gotoAndStop("Damaged");
			}
			Game.checkIfHit(this, Game.getPlayer());
		}

		function removeSelf()
		{
			this.parent.removeChild(this);
			trace(this);
			removeEventListener(Event.ENTER_FRAME, loop2);
		}

		public function getIsDead()
		{
			return isDead;
		}
		public function takeDamage(amount:int)
		{
			this.health -=  amount;
		}
	}
}