/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 13.08.13
 * Time: 19:32
 * To change this template use File | Settings | File Templates.
 */
package data.vo {
public class BandVO {

    public var user:UserInfoVO;
    public var message:String = "";

    public function BandVO(o:Object) {
        setInfo(o);
    }

    public function setInfo(o:Object):void{
        this.message = o.message;
        this.user = new UserInfoVO(o);
    }
}
}
