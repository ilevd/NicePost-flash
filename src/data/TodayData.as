/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 17.04.14
 * Time: 18:34
 * To change this template use File | Settings | File Templates.
 */
package data {
import flash.events.ErrorEvent;

public class TodayData {
    public function TodayData() {
    }


    public static const APRIL:Object = {
        17:[
            "Всемирный день гемофилии (World Haemophilia Day), 25 лет",
            "День гармошечного зова",
            "День ветеранов МВД и внутренних войск РФ, 4 года",
            "Именины у Георгия, Иосифа, Зосимы"
        ],
        18: [
            "День пляски в проснувшемся лесу",
            "День победы на Чудском озере (Ледовое побоище)",
            "Международный день памятников и исторических мест",
            "Всемирный день радиолюбителя (World Amateur Radio Day)",
            "Международный день жонглёров",
            "День независимости - Зимбабве",
            "Именины у Иова, Симеона, Марка, Платона, Феодоры"
        ],
        19: [
            "День путешествующей улыбки",
            "День велосипеда (Bicycle Day)",
            "День образования службы занятости РФ",
            "День работника ломоперерабатывающей отрасли",
            "День подснежника",
            "Праздник читателя этикеток",
            "Именины у Мефодия, Евтихия, Платониды"
        ],
        20: [
            "День охоты на королевского кракозябра",
            "День мобилизационных подразделений МВД РФ",
            "День вилкокрута и ложкочерпия",
            "Национальный день донора крови",
            "Именины у Даниила, Акилины, Георгия"
        ],
        21: [
            "День чемоданов",
            "День местного самоуправления РФ",
            "День создания Морских сил Дальнего Востока",
            "День тяжелых последствий",
            "День Главбуха",
            "Именины у Иродиона, Нифонта"
        ]
    };


    public static const DATA:Array = [
        null, null, null,
        APRIL
    ]


    public static function getArr(month:uint, date:uint):Array{
        try{
            return DATA[month][date];
        } catch (e:Error){

        }
        return null;
    }

}
}