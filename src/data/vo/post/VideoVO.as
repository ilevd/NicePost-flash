/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 22.03.14
 * Time: 23:22
 * To change this template use File | Settings | File Templates.
 */
package data.vo.post {
public class VideoVO {

    public var id:String;
    public var owner_id:String;
    public var title:String;
    public var duration:Number;
    public var description:String;
    public var date:Number;
    public var views:int
    public var comments:int;
    public var photo_130:String;
    public var photo_320:String;
    public var access_key:String;

    public function VideoVO() {
    }
}
}
