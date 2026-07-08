import { render, screen } from '@testing-library/react';

import HomePage from '../app/page';

describe('HomePage', () => {
  it('renders sample heading', () => {
    render(<HomePage />);

    expect(screen.getByRole('heading', { name: '__PROJECT_NAME__' })).toBeInTheDocument();
  });
});
