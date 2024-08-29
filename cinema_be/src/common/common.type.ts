export type MultiItemsResponse<T> = { total?: number; items: T[] };

export type ApiResponse<T> = {
  success?: boolean;
  data?: T | MultiItemsResponse<T>;
  error?: string;
  message?: string | any[];
};
