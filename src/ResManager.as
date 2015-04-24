package {
import flash.display.BitmapData;

import mx.core.BitmapAsset;

public class ResManager {

    [Embed(source="../media/galka.png")]
    public static const GALKA_IMG:Class;

    //[Embed(source="../media/backrgr.jpg")]
    //public static const BACKGROUND:Class;

    [Embed(source="../media/play.png")]
    public static const PLAY_ICON:Class;

    [Embed(source="../media/like_10.png")]
    public static const LIKE_ICON:Class;

    [Embed(source="../media/share_12.png")]
    public static const SHARE_ICON:Class;

    [Embed(source='../media/game_invite.png')]
    public static const INVITE_ICON:Class;

    [Embed(source='../media/closeButtons.swf', symbol='CloseButton')]
    public static const CLOSE_BUTTON1:Class;

    [Embed(source='../media/closeButtons.swf', symbol='CloseButton2')]
    public static const CLOSE_BUTTON2:Class;


    public function ResManager() {
    }

}
}