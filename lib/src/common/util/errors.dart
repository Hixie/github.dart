part of github.common;

/// Error Generated by [GitHub]
class GitHubError implements Exception {
  final String message;
  final String apiUrl;
  final GitHub github;
  final Object source;

  const GitHubError(this.github, this.message, {this.apiUrl, this.source});

  @override
  String toString() => "GitHub Error: $message";
}

class NotReady extends GitHubError {
  const NotReady(GitHub github, String path)
      : super(
          github,
          'Not ready. Try again later',
          apiUrl: path,
        );
}

/// GitHub Entity was not found
class NotFound extends GitHubError {
  const NotFound(
    GitHub github,
    String msg,
  ) : super(github, msg);
}

class BadRequest extends GitHubError {
  const BadRequest(GitHub github, [String msg = 'Not Found'])
      : super(github, msg);
}

/// GitHub Repository was not found
class RepositoryNotFound extends NotFound {
  const RepositoryNotFound(GitHub github, String repo)
      : super(github, "Repository Not Found: $repo");
}

/// GitHub User was not found
class UserNotFound extends NotFound {
  const UserNotFound(GitHub github, String user)
      : super(github, "User Not Found: $user");
}

/// GitHub Organization was not found
class OrganizationNotFound extends NotFound {
  const OrganizationNotFound(GitHub github, String organization)
      : super(github, "Organization Not Found: $organization");
}

/// GitHub Team was not found
class TeamNotFound extends NotFound {
  const TeamNotFound(GitHub github, int id)
      : super(github, "Team Not Found: $id");
}

/// Access was forbidden to a resource
class AccessForbidden extends GitHubError {
  const AccessForbidden(GitHub github) : super(github, "Access Forbidden");
}

/// Client hit the rate limit.
class RateLimitHit extends GitHubError {
  const RateLimitHit(GitHub github) : super(github, "Rate Limit Hit");
}

/// A GitHub Server Error
class ServerError extends GitHubError {
  ServerError(GitHub github, int statusCode, String message)
      : super(github, "${message ?? 'Server Error'} ($statusCode)");
}

/// An Unknown Error
class UnknownError extends GitHubError {
  const UnknownError(GitHub github, [String message])
      : super(github, message != null ? message : "Unknown Error");
}

/// GitHub Client was not authenticated
class NotAuthenticated extends GitHubError {
  const NotAuthenticated(GitHub github)
      : super(github, "Client not Authenticated");
}

class InvalidJSON extends BadRequest {
  const InvalidJSON(GitHub github, [String message = "Invalid JSON"])
      : super(github, message);
}

class ValidationFailed extends GitHubError {
  const ValidationFailed(GitHub github, [String message = "Validation Failed"])
      : super(github, message);
}
