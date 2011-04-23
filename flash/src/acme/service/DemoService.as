package acme.service
{
    import org.tecbot.amf.IAMFManager;

    import mx.rpc.remoting.RemoteObject;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class DemoService
    {
        [Inject]
        public var amfManager : IAMFManager;
        private var _remoteObject : RemoteObject;
        private const DESTINATION : String = "Demo";
        private const SOURCE : String = "DemoService";

        [PostConstruct]
        public function init() : void
        {
            _remoteObject = new RemoteObject(DESTINATION);
            _remoteObject.channelSet = amfManager.channelSet;
            _remoteObject.source = SOURCE;
        }

        public function sendMessage(message : String, onResult : Function, onFault : Function = null) : void
        {
            amfManager.call(_remoteObject.sendMessage, onResult, message, onFault);
        }
    }
}