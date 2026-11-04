-- CashWatch: bảng lưu sổ cho tính năng đồng bộ.
-- Mỗi tài khoản có đúng một dòng. Row Level Security bảo đảm mỗi người chỉ đọc/ghi được dòng của mình.
-- Chạy một lần trong Supabase → SQL Editor.

create table if not exists public.cashwatch_books (
  user_id    uuid primary key references auth.users (id) on delete cascade,
  data       jsonb       not null,
  rev        bigint      not null default 1,
  updated_at timestamptz not null default now()
);

alter table public.cashwatch_books enable row level security;

drop policy if exists "Đọc sổ của mình"  on public.cashwatch_books;
drop policy if exists "Tạo sổ của mình"  on public.cashwatch_books;
drop policy if exists "Sửa sổ của mình"  on public.cashwatch_books;
drop policy if exists "Xóa sổ của mình"  on public.cashwatch_books;

create policy "Đọc sổ của mình" on public.cashwatch_books
  for select to authenticated using (auth.uid() = user_id);
create policy "Tạo sổ của mình" on public.cashwatch_books
  for insert to authenticated with check (auth.uid() = user_id);
create policy "Sửa sổ của mình" on public.cashwatch_books
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Xóa sổ của mình" on public.cashwatch_books
  for delete to authenticated using (auth.uid() = user_id);
