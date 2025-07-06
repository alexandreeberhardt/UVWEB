import { useEffect, useState } from 'react';

function App() {
  const [uvs, setUvs] = useState([]);
  const [selectedUv, setSelectedUv] = useState(null);

  useEffect(() => {
    fetch('http://localhost:3000/uvs')
      .then(res => res.json())
      .then(setUvs);
  }, []);

  if (!selectedUv) {
    return (
      <div style={{ maxWidth: 400, margin: '2rem auto', fontFamily: 'sans-serif' }}>
        <h1>Sélectionnez une UV</h1>
        <select
          style={{ width: '100%', fontSize: '1rem', padding: 8 }}
          onChange={e => {
            const code = e.target.value;
            if (code) setSelectedUv(code);
          }}
          defaultValue=""
        >
          <option value="" disabled>Choisir une UV</option>
          {uvs.map(uv => (
            <option key={uv.code_uv} value={uv.code_uv}>
              {uv.titre} ({uv.code_uv})
            </option>
          ))}
        </select>
      </div>
    );
  } else {
    return <UvDetails code_uv={selectedUv} onBack={() => setSelectedUv(null)} />;
  }
}

function UvDetails({ code_uv, onBack }) {
  const [uv, setUv] = useState(null);

  useEffect(() => {
    fetch(`http://localhost:3000/uvs/${code_uv}/details`)
      .then(res => res.json())
      .then(setUv);
  }, [code_uv]);

  if (!uv) return <div style={{ textAlign: 'center' }}>Chargement...</div>;

  return (
    <div style={{ maxWidth: 700, margin: '2rem auto', fontFamily: 'sans-serif' }}>
      <button onClick={onBack} style={{ marginBottom: 16 }}>&larr; Retour</button>
      <h1>{uv.titre} ({uv.code_uv})</h1>
      <p>
        <b>Catégorie :</b> {uv.categorie} <br />
        <b>ECTS :</b> {uv.ects} <br />
        <b>Active :</b> {uv.actif ? 'Oui' : 'Non'}
      </p>
      <hr />

      <h2>Responsables et Semestres</h2>
      <ul>
        {uv.assurers.length === 0 && <li>Aucun</li>}
        {uv.assurers.map(a =>
          <li key={a.id_semestre + '-' + a.id_responsable}>
            {a.responsable.prenom} {a.responsable.nom} (semestre : {a.semestre.periode})
          </li>
        )}
      </ul>
      <hr />

      <h2>Evaluations</h2>
      <ul>
        {uv.evaluations.length === 0 && <li>Aucune</li>}
        {uv.evaluations.map(e =>
          <li key={e.id_evaluation}>
            <b>{e.libelle_critere}</b> ({e.note}/5) – Semestre : {e.id_semestre}
          </li>
        )}
      </ul>
      <hr />

      <h2>Statistiques</h2>
      <ul>
        {uv.statistiques.length === 0 && <li>Aucune</li>}
        {uv.statistiques.map(s =>
          <li key={s.id_stat}>
            Semestre : {s.id_semestre} – Taux de réussite : {s.taux_reussite}%
          </li>
        )}
      </ul>
      <hr />

      <h2>Avis</h2>
      <ul>
        {uv.avis.length === 0 && <li>Aucun</li>}
        {uv.avis.map(a =>
          <li key={a.id_avis}>
            <b>{a.auteur}</b> ({a.date.slice(0, 10)}) : {a.contenu}
          </li>
        )}
      </ul>
      <hr />

      <h2>Documents</h2>
      <ul>
        {uv.documents.length === 0 && <li>Aucun</li>}
        {uv.documents.map(d =>
          <li key={d.id_doc}>
            <a href={d.url} target="_blank" rel="noreferrer">{d.nom}</a> ({d.type}) – Ajouté le {d.date_ajout.slice(0, 10)}
          </li>
        )}
      </ul>
    </div>
  );
}

export default App;
