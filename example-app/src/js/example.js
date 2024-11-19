import { KeepAwake } from 'keep-awake';



async function preventSleep(keepAwake) {
  try {
    await KeepAwake.enable();
    // console.log('Keep awake state:', result.keepAwake);
  } catch (error) {
    console.error('Error toggling keep awake:', error);
  }
}

window.testEcho = async () => {
    
console.log('Testing echo with value:');
  const inputValue = document.getElementById("echoInput").value;

  console.log('Testing echo with value:', inputValue);

  try {
    // Test the echo functionality
    const echoResult = await KeepAwake.echo({ value: inputValue });
    console.log('Echo result:', echoResult);

    // Prevent screen from sleeping
    await preventSleep(true);
    console.log('Keep awake enabled.');

    const val = await KeepAwake.isEnabled()
    console.log('Keep awake state:', val.value);
  } catch (error) {
    console.error('Error in testEcho:', error);
  }
};
