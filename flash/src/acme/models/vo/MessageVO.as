package acme.models.vo
{
    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    [Bindable]
    [RemoteClass(alias="MessageVO")]
    public class MessageVO
    {
        public var message : String;
        public var serverTime : int;
    }
}