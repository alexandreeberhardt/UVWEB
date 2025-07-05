import { useEffect, useState } from 'react';

function App() {
  const [tests, setTests] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3000/tests')
      .then(res => res.json())
      .then(data => setTests(data));
  }, []);

  return (
    <div style={{ maxWidth: 400, margin: '2rem auto', fontFamily: 'sans-serif' }}>
      <h1>Liste des tests</h1>
      <ul>
        {tests.map(test => (
          <li key={test.id}>{test.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
