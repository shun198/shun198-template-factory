import React from 'react';
import { render, screen } from '@testing-library/react';
import { afterEach, vi } from 'vitest';

import HomePage from '../app/page';

describe('HomePage', () => {
  afterEach(() => {
    vi.unstubAllEnvs();
  });

  it('renders the fallback app name', () => {
    vi.stubEnv('NEXT_PUBLIC_APP_NAME', undefined);
    render(<HomePage />);

    expect(
      screen.getByRole('heading', { name: '__PROJECT_NAME__' }),
    ).toBeInTheDocument();
  });

  it('renders the configured app name', () => {
    vi.stubEnv('NEXT_PUBLIC_APP_NAME', 'Custom Dashboard');
    render(<HomePage />);

    expect(
      screen.getByRole('heading', { name: 'Custom Dashboard' }),
    ).toBeInTheDocument();
  });

  it('renders the starter status cards', () => {
    render(<HomePage />);

    expect(screen.getByText('App Router')).toBeInTheDocument();
    expect(screen.getByText('enabled')).toBeInTheDocument();
    expect(screen.getByText('Testing')).toBeInTheDocument();
    expect(screen.getByText('Vitest + Testing Library')).toBeInTheDocument();
    expect(screen.getByText('Formatting')).toBeInTheDocument();
    expect(screen.getByText('Prettier')).toBeInTheDocument();
  });
});
