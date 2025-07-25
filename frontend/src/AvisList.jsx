import React from 'react';
import AvisCard from './AvisCard';
import './AvisList.css';

export default function AvisList({ avis }) {
  if (!avis || avis.length === 0) {
    return <p>Aucun avis pour cette UV.</p>;
  }

  return (
  <div className="avis-list">
    {avis.map((a, index) => (
      <div key={a.id_avis}>
        <AvisCard
          auteur={a.auteur}
          date={a.date}
          note={a.note}
          contenu={a.contenu}
        />
        {index !== avis.length - 1 && <hr />}
      </div>
    ))}
  </div>
);
}