<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class PermissionMiddleware
{
    public function handle($request, Closure $next, $permission)
    {
        if (!Auth::check() || !Auth::user()->hasPermission($permission)) {
            if ($request->expectsJson()) {
                return response()->json(['statusCode' => 403, 'statusMsg' => 'Your are Not Unauthorized.'], 403);
            }

            abort(403, 'Unauthorized action.');
        }

        return $next($request);
    }
}
