package acme.controller
{
    import acme.utils.Config;
    import org.robotlegs.mvcs.SignalCommand;
    import org.tecbot.amf.AMFManager;
    import org.tecbot.amf.IAMFManager;


    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class ApplicationCompleteCommand extends SignalCommand
    {
        override public function execute() : void
        {
            var amfManager : IAMFManager = new AMFManager(Config.ENDPOINT, Config.GATEWAY);
            injector.mapValue(IAMFManager, amfManager);
        }
    }
}