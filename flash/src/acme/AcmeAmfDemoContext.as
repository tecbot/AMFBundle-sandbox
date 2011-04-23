package acme
{
    import acme.controller.ApplicationCompleteCommand;
    import acme.controller.SendMessageCommand;
    import acme.models.MessageModel;
    import acme.models.signals.ErrorAddedSignal;
    import acme.models.signals.MessageAddedSignal;
    import acme.service.DemoService;
    import acme.view.components.MessageUI;
    import acme.view.mediators.ApplicationMediator;
    import acme.view.mediators.MessageUIMediator;
    import acme.view.signals.ApplicationCompleteSignal;
    import acme.view.signals.SendMessageSignal;

    import org.robotlegs.mvcs.SignalContext;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class AcmeAmfDemoContext extends SignalContext
    {
        override public function startup() : void
        {
            mapController();
            mapModels();
            mapService();
            mapView();
        }

        private function mapController() : void
        {
            signalCommandMap.mapSignalClass(ApplicationCompleteSignal, ApplicationCompleteCommand);
            signalCommandMap.mapSignalClass(SendMessageSignal, SendMessageCommand);
        }

        private function mapModels() : void
        {
            injector.mapSingleton(MessageModel);
            injector.mapSingleton(MessageAddedSignal);
            injector.mapSingleton(ErrorAddedSignal);
        }

        private function mapService() : void
        {
            injector.mapSingleton(DemoService);
        }

        private function mapView() : void
        {
            mediatorMap.mapView(AcmeAmfDemo, ApplicationMediator);
            mediatorMap.mapView(MessageUI, MessageUIMediator);
        }
    }
}