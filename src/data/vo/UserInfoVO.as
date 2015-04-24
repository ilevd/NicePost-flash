/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 07.08.13
 * Time: 18:15
 * To change this template use File | Settings | File Templates.
 */
package data.vo {


public class UserInfoVO {

    //self user
    /*"id":591866,"external_id":"1039055","sn_id":1,"sex":2,"age":1989,
    "city":73,"city_name":"Красноярск","first_name":"Игорь",
    "last_name":"Левданский","photo":"http://cs1577.vk.me/u1039055/a_f2fd5376.jpg",
    "all_kisses":754,"avg_mark":9.5982685424124216667,"num_marks":12013,
    "energy":1016,"money":2879,"last_bonus_time":1364924327,
    "last_visit":1375872422,"num_gifts":312,"send_gifts":295,"num_marked_users":21690,
    "musers_clear_time":1375872354,"real_avg_mark":9.2867059593974996545,"real_num_marks":7635,"first_bonus":1,
    "permissions":900,"internal_city":3847,"link":"","last_mark_bonus":1364971713,"owner":592871,"price":40,"menu_bonus":3,"group_bonus":3}}
     */

    /*
    {"id":1421052,"external_id":"179254261","sn_id":1,"sex":1,"age":1996,
            "city":73,"city_name":"Красноярск","first_name":"Наташа",
            "last_name":"Сургуцкая","photo":"http://cs419830.userapi.com/v419830261/2cf7/0g-yjnhWCOE.jpg",
            "all_kisses":6,"avg_mark":9.5,"num_marks":12,"num_gifts":0,"energy":0,
            "last_visit":1361212921,"permissions":0,"link":"","online":0,"owner":0,"price":1},

      */

    //in harem arr
    /*
    {"id":859245,"external_id":"139889037","sn_id":1,"sex":2,"age":1997,"city":158,
    "city_name":"Челябинск","first_name":"Андрей","last_name":"Сергеевич",
    "photo":"http://cs314630.vk.me/v314630037/298c/-KPn4RcRfK0.jpg",
    "all_kisses":26,"avg_mark":29.600000000000008527,"num_marks":137,"num_gifts":7,
    "energy":6760,"last_visit":1376120079,"permissions":0,"link":"","online":0,
    "owner":1617832,"price":5}
    */

    //new gift
    /*

     {"new":0,"gift_id":110,"date":1368301886,"id":412353,
     "external_id":"117396068","sn_id":1,"sex":1,"age":1993,"city":2106,"city_name":"Ивано-Франковск",
     "first_name":"Ірина","last_name":"Прокопчук","photo":"http://cs419027.vk.me/v419027068/4fa5/bFzWvcLLCf4.jpg"
     ,"all_kisses":35,"avg_mark":9.7341772151898720011,"num_marks":79,"num_gifts":1,"energy":20,
     "last_visit":1368302357,"permissions":0,"link":"","online":0,"owner":0,"price":1}
     */

    public var id:int;
    public var external_id:String;
    public var sn_id:int;
    public var sex:int;
    public var age:int;
    public var city:int;
    public var city_name:String;
    public var first_name:String;
    public var last_name:String;
    public var photo:String;
    public var all_kisses:int;
    public var avg_mark:Number;
    public var num_marks:int;
    public var num_gifts:int;
    public var energy:int;
    public var last_visit:int;
    public var permissions:int;
    public var link:String;
    public var online:int;
    public var owner:int = 0;
    public var price:int;

    public var owner_info:UserInfoVO;
    public var harem:Vector.<UserInfoVO> = new Vector.<UserInfoVO>();

    public function UserInfoVO(o:Object = null):void {
        if( o != null ){
            setInfo(o);
        }
    }

    public function setInfo(o:Object):void {
        id = o.id;
        external_id = o.external_id;
        sn_id = o.sn_id;
        sex = o.sex;
        age = o.age;
        city = o.city;
        city_name = o.city_name;
        first_name = o.first_name;
        last_name = o.last_name;
        photo =o.photo;
        all_kisses = o.all_kisses;
        avg_mark = o.avg_mark;
        num_marks = o.num_marks;
        num_gifts = o.num_gifts;
        energy = o.energy;
        last_visit = o.last_visit;
        permissions = o.permissions;
        link = o.link;
        online = o.online;
        price = o.price;
        owner = o.owner;

        if(o.owner_info){
            owner_info = new UserInfoVO(o.owner_info);
        }

    }



}
}
