/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Highscore.View {
	
	import flash.display.Sprite;
	
	import de.p3337.zzznake.Highscore.Model.HighscoreModel;
	import de.p3337.zzznake.Main.Zzznake;
	import de.p3337.zzznake.Util.DefaultButton;
	import de.p3337.zzznake.Util.DefaultHeadline;

	/**
	 * The HighscoreNewEntryView creates a table of the ten best users and their attained score. 
	 */
	public class HighscoreRankingView {
		private var model:HighscoreModel;
		private var _view:Sprite;
		private var _backButton:DefaultButton;
		
		private var tableHead:Sprite;
		private var tableBody:Sprite;
		
		/**
		 * Creates a new HighscoreRankingView.
		 * 
		 * @param HighscoreModel
		 */
		public function HighscoreRankingView(highscoreModel:HighscoreModel) {
			model = highscoreModel;
			
			_view = new Sprite();
			_view.x = Zzznake.ZZZNAKE_PADDING;
			
			draw();
		}
		
		public function get view():Sprite {
			return _view;
		}
		
		private function draw():void {
			_view.removeChildren();
			
			createTableHead();
			tableHead.y = Zzznake.ZZZNAKE_PADDING;
			_view.addChild(tableHead);
			
			createTableBody();
			tableBody.y = tableHead.y + (Zzznake.ZZZNAKE_PADDING / 2);
			_view.addChild(tableBody);
			
			_backButton = new DefaultButton("Main menu");
			_backButton.y = Zzznake.ZZZNAKE_HEIGHT - _backButton._height - Zzznake.ZZZNAKE_PADDING;
			_view.addChild(_backButton);
		}
		
		private function createTableHead():void {
			tableHead = new Sprite();
			
			var headline:Sprite = new DefaultHeadline("Highscore");
			tableHead.addChild(headline);
			
			var row:HighscoreRow = new HighscoreRow("#", "Name", "Score", "bold");
			row.y = headline.y + headline.height + Zzznake.ZZZNAKE_PADDING;
			tableHead.addChild(row);
		}
		
		private function createTableBody():void {
			tableBody = new Sprite();
			for (var i:int = 0; i < 10; i++) {
				var row:HighscoreRow = new HighscoreRow((i + 1).toString(), model.rankingObject[i].name, model.rankingObject[i].score);
				row.y = row.FIELD_HEIGHT * (i + 1) + (Zzznake.ZZZNAKE_PADDING * 2);
				tableBody.addChild(row);
			}
		}
		
		private function updateTableBody():void {
			for (var i:int = 0; i < tableBody.numChildren; i++) {
				if(tableBody.getChildAt(i) is HighscoreRow) {
					var row:HighscoreRow = HighscoreRow(tableBody.getChildAt(i)); 
					row.setMiddleColumnText(model.rankingObject[i].name);
					row.setRightColumnText(model.rankingObject[i].score);
				}
			}
			
		}
		
		public function update(event:*):void {
			updateTableBody();
		}
		
		public function get backButton():DefaultButton {
			return _backButton;
		}

	}
}