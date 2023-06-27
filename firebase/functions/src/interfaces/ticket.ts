export interface Ticket {
  _type: 'ticket';
  id: number;
  slug: string;
  unique_url: string;
  company_name?: string;
  email: string;
  first_name: string;
  last_name: string;
  name: string;
  reference: string;
  state: 'complete' | 'incomplete';
  test_mode: boolean;
  registration_id: number;
  release_id: number;
  avatar_url: string;
  void: boolean;
  changes_locked: boolean;
  consented_at?: string | null;
  discount_code_used?: string | null;
  created_at: string;
  updated_at: string;
  assigned: boolean;
  qr_url: string;
  show_qr_code: boolean;
  qr_code_disabled: boolean;
}
