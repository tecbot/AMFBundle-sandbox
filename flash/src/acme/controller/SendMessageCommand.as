package acme.controller
{
    import acme.models.MessageModel;
    import acme.models.vo.ErrorVO;
    import acme.models.vo.MessageVO;
    import acme.service.DemoService;

    import org.robotlegs.mvcs.SignalCommand;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class SendMessageCommand extends SignalCommand
    {
        [Inject]
        public var message : String;
        [Inject]
        public var messageService : DemoService;
        [Inject]
        public var messageModel : MessageModel;

        override public function execute() : void
        {
            messageService.sendMessage(message, onResultHandler, onFaultHandler);
        }

        private function onResultHandler(event : ResultEvent) : void
        {
            if (event.result is ErrorVO) {
                messageModel.addError(event.result as ErrorVO);
            } else {
                messageModel.add(event.result as MessageVO);
            }
        }

        private function onFaultHandler(event : FaultEvent) : void
        {
            var error : ErrorVO = new ErrorVO();
            error.message = event.fault.toString();
            messageModel.addError(error);
        }
    }
}
