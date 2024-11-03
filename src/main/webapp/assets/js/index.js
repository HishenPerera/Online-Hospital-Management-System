// Get the button and section elements
const button = document.querySelector('.btn-primary');
const targetSection = document.querySelector('#target-section');

// Add an event listener to the button
button.addEventListener('click', () => {
	// Scroll to the target section with a smooth animation
	const scrollOptions = {
		top: targetSection.offsetTop,
		left: 0,
		behavior: 'smooth'
	};
	window.scrollTo(scrollOptions);
});