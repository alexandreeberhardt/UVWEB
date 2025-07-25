import React from 'react';
import './AvisCard.css';

export default function AvisCard({ auteur, date, note, contenu }) {
  return (
    <div className="avis-card">
      <div className="avis-left">
        {auteur}
        <span>{date?.slice(0, 10)}</span>
        <span>Note : {note}/10</span>
      </div>
      <div className="avis-right">
        {contenu}
      </div>
    </div>
  );
}