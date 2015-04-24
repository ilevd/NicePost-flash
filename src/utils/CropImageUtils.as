/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 14.03.13
 * Time: 1:11
 * To change this template use File | Settings | File Templates.
 */
package utils {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.system.LoaderContext;

import mx.core.UIComponent;

import spark.components.Image;

import view.posts.Post;

public class CropImageUtils {

    private var m_Loader:Loader;
    private var m_W:Number;
    private var m_H:Number;
    private var m_Img:Image;


    public function CropImageUtils() {
    }

    public static function cropImage(m_Img:Image):void {
        if (m_Img == null) return;
        m_Img.addEventListener(Event.COMPLETE, function (event:Event):void {
            try {
                var w:Number = m_Img.maxWidth;
                var h:Number = m_Img.maxHeight;
                var imgH:Number = m_Img.bitmapData.height;
                var imgW:Number = m_Img.bitmapData.width;
                var cropRect:Rectangle
                if (imgH / imgW >= h / w) {
                    cropRect = new Rectangle(0, /*(imgH - imgW*h/w)/3*/0, imgW, imgW * h / w);
                } else {
                    cropRect = new Rectangle((imgW - imgH * w / h) / 2, 0, imgH * w / h, imgH);
                }
                var bmpData:BitmapData = new BitmapData(cropRect.width, cropRect.height, true);
                bmpData.copyPixels(m_Img.bitmapData, cropRect, new Point(0, 0));
                m_Img.source = bmpData;

            } catch (e:Error) {
            }
        });
        m_Img.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function (event:Event):void {
            //trace('Error!', img.source);
        });
        m_Img.addEventListener(IOErrorEvent.IO_ERROR, function (event:Event):void {
            //trace('Error!', img.source);
        });
    }





    public static function scaleImageByWidth(m_Img:Image):void {
        if (m_Img == null) return;
        m_Img.addEventListener(Event.COMPLETE, function (event:Event):void {
            try {
                m_Img.maxHeight = m_Img.height = m_Img.maxWidth * m_Img.bitmapData.height / m_Img.bitmapData.width;
                m_Img.width = m_Img.maxWidth;
                m_Img.smooth = true;
            } catch (e:Error) {
            }
        });
        m_Img.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function (event:Event):void {
            //trace('Error!', img.source);
        });
        m_Img.addEventListener(IOErrorEvent.IO_ERROR, function (event:Event):void {
            //trace('Error!', img.source);
        });
    }














    public static function scaleCropBitmapData(w:Number, h:Number, bitmapData:BitmapData):BitmapData {
        var imgH:Number = bitmapData.height;
        var imgW:Number = bitmapData.width;
        var cropRect:Rectangle
        if (imgH / imgW >= h / w) {
            cropRect = new Rectangle(0, (imgH - imgW * h / w) / 3, imgW, imgW * h / w);
        } else {
            cropRect = new Rectangle((imgW - imgH * w / h) / 2, 0, imgH * w / h, imgH);
        }
        var bmpData:BitmapData = new BitmapData(cropRect.width, cropRect.height, true);
        bmpData.copyPixels(bitmapData, cropRect, new Point(0, 0));
        return bmpData;
    }


    public function loadImage(w:Number, h:Number, url:String, img:Image):void {
        trace("CropImageUtils load!")
        m_Loader = new Loader();
        m_W = w;
        m_H = h;
        m_Img = img;
        m_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
        m_Loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadError, false, 0, true);
        var req:URLRequest = new URLRequest(url);
        var lc:LoaderContext = new LoaderContext();
        lc.checkPolicyFile = true;
        m_Loader.load(req, lc);
    }


    private function onLoadComplete(e:Event):void {
        trace("CropImageUtils complete!")
        //trace("BitmapDataLoader: " + m_Loader + " " + m_Loader.content );
        m_Loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);
        m_Loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
        var bmp:Bitmap = Bitmap(m_Loader.content);
        var bmpData:BitmapData = scaleCropBitmapData(m_W, m_H, bmp.bitmapData);
        //m_Func( bmpData );
        m_Img.source = bmp.bitmapData;
    }

    private function onLoadError(e:*):void {
        trace("CropImageUtils error");
    }


}
}
