import React from 'react';

type StatusCardProps = {
  title: string;
  value: string;
};

export function StatusCard({ title, value }: StatusCardProps) {
  return (
    <article className="card">
      <p>{title}</p>
      <strong>{value}</strong>
    </article>
  );
}
