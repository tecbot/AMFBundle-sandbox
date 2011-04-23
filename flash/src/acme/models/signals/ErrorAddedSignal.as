package acme.models.signals
{
    import acme.models.vo.ErrorVO;

    import org.osflash.signals.Signal;

    /**
     * @author Thomas Adam <thomas.adam@tecbot.de>
     */
    public class ErrorAddedSignal extends Signal
    {
        public function ErrorAddedSignal()
        {
            super(ErrorVO);
        }
    }
}
