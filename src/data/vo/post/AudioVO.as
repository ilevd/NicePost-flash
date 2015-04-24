/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 21.03.14
 * Time: 10:56
 * To change this template use File | Settings | File Templates.
 */
package data.vo.post {
public class AudioVO {

    public var id:String;
    public var owner_id:String;
    public var title:String;
    public var artist:String;
    public var duration:int;
    public var url:String;
    public var lyrics_id:int;
    public var genre_id:int;

    public function AudioVO() {
    }
}
}
