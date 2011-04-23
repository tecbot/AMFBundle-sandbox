package acme.view.mediators
{
    import acme.models.signals.ErrorAddedSignal;
    import acme.models.signals.MessageAddedSignal;
    import acme.models.vo.ErrorVO;
    import acme.models.vo.MessageVO;
    import acme.view.components.MessageUI;
    import acme.view.signals.SendMessageSignal;

    import org.robotlegs.mvcs.Mediator;

    import flash.events.MouseEvent;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class MessageUIMediator extends Mediator
    {
        [Inject]
        public var view : MessageUI;
        [Inject]
        public var onSendMessage : SendMessageSignal;
        [Inject]
        public var onMessageAdded : MessageAddedSignal;
        [Inject]
        public var onErrorAdded : ErrorAddedSignal;

        override public function onRegister() : void
        {
            view.btnSend.addEventListener(MouseEvent.CLICK, onBtnSendClickHandler);
            onMessageAdded.add(onMessageAddedHandler);
            onErrorAdded.add(onErrorAddedHandler);
        }

        private function onBtnSendClickHandler(event : MouseEvent) : void
        {
            onSendMessage.dispatch(view.txtMessage.text);
            view.txtMessage.text = "";
        }

        private function onMessageAddedHandler(message : MessageVO) : void
        {
            view.messages.text += "Server Time: " + message.serverTime + " Message: " + message.message + "\n";
        }

        private function onErrorAddedHandler(error : ErrorVO) : void
        {
        	view.messages.text += "Error: " + error.message + "\n";
        }
    }
}