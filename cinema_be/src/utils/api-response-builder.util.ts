export type MultiItemsResponse<T> = { items: T[]; total: number };

export type ApiResponse<T> = {
  success?: boolean;
  data?: T | MultiItemsResponse<T>;
  error?: string;
  message?: string | any[];
};

export function buildSuccessResponse(data?: any): ApiResponse<any> {
  return {
    success: true,
    data,
  };
}

export function buildErrorResponse(
  error: string,
  message?: string | any[],
): ApiResponse<any> {
  return {
    success: false,
    error,
    message,
  };
}
