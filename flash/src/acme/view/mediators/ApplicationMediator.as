package acme.view.mediators
{
    import acme.view.signals.ApplicationCompleteSignal;

    import org.robotlegs.mvcs.Mediator;

    import mx.events.FlexEvent;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class ApplicationMediator extends Mediator
    {
        [Inject]
        public var view : AcmeAmfDemo;
        [Inject]
        public var onApplicationComplete : ApplicationCompleteSignal;

        override public function onRegister() : void
        {
            view.addEventListener(FlexEvent.APPLICATION_COMPLETE, onApplicationCompleteHandler);
        }

        private function onApplicationCompleteHandler(event : FlexEvent) : void
        {
            view.removeEventListener(FlexEvent.APPLICATION_COMPLETE, onApplicationCompleteHandler);
            onApplicationComplete.dispatch();
        }
    }
}