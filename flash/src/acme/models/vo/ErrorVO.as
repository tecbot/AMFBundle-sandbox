package acme.models.vo
{
    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    [Bindable]
    [RemoteClass(alias="ErrorVO")]
    public class ErrorVO
    {
        public var message : String;
    }
}
