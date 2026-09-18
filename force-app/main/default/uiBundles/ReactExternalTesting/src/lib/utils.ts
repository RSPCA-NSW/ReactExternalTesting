import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}


export function stripHTML(html: string | null | undefined){
  if(!html) return '';
  return html.replace(/<[^>]*>/g, '');
}