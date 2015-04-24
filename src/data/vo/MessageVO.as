/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 10.08.13
 * Time: 18:58
 * To change this template use File | Settings | File Templates.
 */
package data.vo {
import view.profile.Message;

public class MessageVO {

    public var user:UserInfoVO;


    public var isNew:Boolean = true;
    public var date:Number = 0;
    public var type:uint = 0;

    public var haremUser:UserInfoVO;
    public var harem_user_id:uint;

    public var amount:Number = 0;
    public var gift_id:int = 0;
    public var mark:Number = 0;


    public function MessageVO(o:Object):void{
        setInfo(o);
    }

    public function setInfo(o:Object):void{

        if(o["new"] == 0){
            this.isNew = false;
        }
        if(o.date){
            this.date = o.date;
        } else{
            this.date = Math.round(new Date().getTime()/1000);
        }

        if(o.owner_info){
            this.user = new UserInfoVO(o.owner_info);
            this.harem_user_id = o.user_id;
            if(o.user_info){
                this.haremUser = new UserInfoVO(o.user_info);
            }
            this.type = Message.HAREM;
        }
        if(o.gift_id){
            this.user = new UserInfoVO(o);
            this.gift_id = o.gift_id;
            this.type = Message.GIFT;
        }
        if(o.amount){
            this.user = new UserInfoVO(o);
            this.amount = o.amount;
            this.type = Message.MONEY;
        }
        if(o.mark){
            this.user = new UserInfoVO(o);
            this.mark = o.mark;
            this.type = Message.MARK;
        }
    }
}
}
