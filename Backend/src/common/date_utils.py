from datetime import datetime, timezone


def time_now() -> datetime:
    return datetime.now(tz=timezone.utc)


def date_to_unix(date: datetime) -> int:
    return int(date.timestamp())


def iso_to_unix(iso_str: str):
    """Convert ISO 8601 string to Unix timestamp."""
    # Check if the input is None or not a string
    if iso_str is None or not isinstance(iso_str, str):
        return None  # Return None if the input is not valid

    try:
        # Attempt to parse the ISO string to a datetime object
        dt = datetime.fromisoformat(iso_str)
        return date_to_unix(dt)
    except ValueError:
        # If there's an error in parsing (e.g., if the format is incorrect)
        print(f"Invalid ISO date format: {iso_str}")
        return None
