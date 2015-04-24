/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 12.08.13
 * Time: 16:22
 * To change this template use File | Settings | File Templates.
 */
package utils {
import flash.system.LoaderContext;

import mx.controls.Image;
import mx.core.UIComponent;

public class MaskImage extends Image {

    protected var _roundedMask:UIComponent
    protected var _cornerRad:int;


    public function MaskImage() {
        //super();
    }


    /*override public function set source (value:Object):void{
     //this.loaderContext.checkPolicyFile = true;
     super.source = value;
     } */

    public function set cornerRadius(radius:int):void {
        var l:LoaderContext = new LoaderContext();
        l.checkPolicyFile = true;
        this.loaderContext = l;
        _cornerRad = radius;
    }

    override protected function createChildren():void {
        super.createChildren();
        _roundedMask = new UIComponent();
        addChild(_roundedMask);
    }

    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {

        super.updateDisplayList(unscaledWidth, unscaledHeight);

        //if the image is present, add the mask
        try {

            if (content == null){
                return;
            }

            var w:Number = this.minWidth; //190;
            var h:Number = this.minHeight; //240;

            trace("")

            //this.height =
                    this.content.height *= w / this.content.width;
            //this.width
                     this.content.width = w;

            this.smoothBitmapContent = true;

            this.height = this.content.height;
            this.width = this.content.width;

            /*
            if (h / w < this.content.height / this.content.width) {
                this.content.height *= w / this.content.width;
                this.content.width = w;
            } else {
                this.content.width *= h / this.content.height;
                this.content.height = h;
            }

            this.content.x = -(this.content.width - w) / 2;
            //this.content.y =- (this.content.height - h) / 3;*/




            _roundedMask.graphics.clear();
            _roundedMask.graphics.beginFill(0x000000);
            _roundedMask.graphics.drawRoundRectComplex(0, 0, this.content.width, this.content.height, _cornerRad, _cornerRad, _cornerRad, _cornerRad);
            _roundedMask.graphics.endFill();

            this.mask = _roundedMask;
        } catch (er:Error) {
        }

    }

}
}
