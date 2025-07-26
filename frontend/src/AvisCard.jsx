import React, { useState, useRef, useEffect } from 'react';
import './AvisCard.css';

export default function AvisCard({ auteur, date, note, contenu }) {
  const [expanded, setExpanded] = useState(false);
  const [isOverflowing, setIsOverflowing] = useState(false);
  const contentRef = useRef();
  useEffect(() => {
    if (contentRef.current) {
      setIsOverflowing(contentRef.current.scrollHeight > contentRef.current.clientHeight);
    }
  }, [contenu]);

  return (
    <div className={`avis-card ${expanded ? 'expanded' : ''}`}>
      <div className="avis-left">
        <div className="auteur">
        {auteur}
        </div>
        <div className="date">
        {date?.slice(8, 10) +" / "+ date?.slice(5, 7) +" / "+ date?.slice(0, 4)}
        </div>
        <div className="note-circle" style={{ backgroundColor: getNoteColor(note) }}>
        {note}
        </div>
      </div>
      <div className="avis-right">
        <div
          className="avis-content"
          ref={contentRef}
        >
          {contenu}
        </div>
        {isOverflowing && !expanded && (
          <button className="expand-button" onClick={() => setExpanded(true)}>Voir plus</button>
        )}
      </div>
    </div>
  );
}

function getNoteColor(note) {
  if (note >= 8) return '#4CAF50'; // vert
  if (note >= 5) return '#F0F0F0'; // blanc / gris
  return '#F44336'; // rouge
}