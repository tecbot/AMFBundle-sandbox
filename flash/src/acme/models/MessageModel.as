package acme.models
{
    import acme.models.signals.ErrorAddedSignal;
    import acme.models.signals.MessageAddedSignal;
    import acme.models.vo.ErrorVO;
    import acme.models.vo.MessageVO;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class MessageModel
    {
        [Inject]
        public var onMessageAdded : MessageAddedSignal;
        [Inject]
        public var onErrorAdded : ErrorAddedSignal;
        private var _messages : Vector.<MessageVO> = new Vector.<MessageVO>();
        private var _errors : Vector.<ErrorVO> = new Vector.<ErrorVO>();

        public function add(message : MessageVO) : void
        {
            _messages.push(message);
            onMessageAdded.dispatch(message);
        }

        public function addError(error : ErrorVO) : void
        {
            _errors.push(error);
            onErrorAdded.dispatch(error);
        }
    }
}