import { KeepAwake } from 'keep-awake';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    KeepAwake.echo({ value: inputValue })
}
