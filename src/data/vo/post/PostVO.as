/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 21.03.14
 * Time: 10:40
 * To change this template use File | Settings | File Templates.
 */
package data.vo.post {
import data.vo.*;

public class PostVO {


    public var id:int;
    public var from_id:String;
    public var owner_id:String;
    public var date:Number;
    public var post_type:String;
    public var text:String;


    public var copy_history:Vector.<PostVO>;

    public var photos:Vector.<PhotoVO>;
    public var audios:Vector.<AudioVO>;
    public var videos:Vector.<VideoVO>;
    public var links:Vector.<LinkVO>;


    public var likes:LikesVO;
    public var reposts:RepostsVO;


    public function PostVO() {
        photos = new Vector.<PhotoVO>();
        audios = new Vector.<AudioVO>();
        videos = new Vector.<VideoVO>();
        links = new Vector.<LinkVO>();
    }


    public function getAtts(addSelfLink:Boolean = true):String {
        var arr:Array = [];
        for (var i:uint = 0; i < photos.length; i++) {
            arr.push("photo" + photos[i].owner_id + "_" + photos[i].id);
        }
        for (i = 0; i < videos.length; i++) {
            arr.push("video" + videos[i].owner_id + "_" + videos[i].id);
        }
        for (i = 0; i < audios.length; i++) {
            arr.push("audio" + audios[i].owner_id + "_" + audios[i].id);
        }
        if( addSelfLink && photos.length > 0){
            arr.push("http://vk.com/nicepost");
        }
        return arr.join(",");
    }


}
}
