# Warning, this file is autogenerated by cbindgen. Don't modify this manually. */

from cpython.object cimport PyObject
from libc.stdint cimport uint8_t, uint64_t, uintptr_t
from nautilus_trader.core.rust.core cimport CVec, UUID4_t

cdef extern from "../includes/common.h":

    # The state of a component within the system.
    cpdef enum ComponentState:
        # When a component is instantiated, but not yet ready to fulfill its specification.
        PRE_INITIALIZED # = 0,
        # When a component is able to be started.
        READY # = 1,
        # When a component is executing its actions on `start`.
        STARTING # = 2,
        # When a component is operating normally and can fulfill its specification.
        RUNNING # = 3,
        # When a component is executing its actions on `stop`.
        STOPPING # = 4,
        # When a component has successfully stopped.
        STOPPED # = 5,
        # When a component is started again after its initial start.
        RESUMING # = 6,
        # When a component is executing its actions on `reset`.
        RESETTING # = 7,
        # When a component is executing its actions on `dispose`.
        DISPOSING # = 8,
        # When a component has successfully shut down and released all of its resources.
        DISPOSED # = 9,
        # When a component is executing its actions on `degrade`.
        DEGRADING # = 10,
        # When a component has successfully degraded and may not meet its full specification.
        DEGRADED # = 11,
        # When a component is executing its actions on `fault`.
        FAULTING # = 12,
        # When a component has successfully shut down due to a detected fault.
        FAULTED # = 13,

    # A trigger condition for a component within the system.
    cpdef enum ComponentTrigger:
        # A trigger for the component to initialize.
        INITIALIZE # = 1,
        # A trigger for the component to start.
        START # = 2,
        # A trigger when the component has successfully started.
        START_COMPLETED # = 3,
        # A trigger for the component to stop.
        STOP # = 4,
        # A trigger when the component has successfully stopped.
        STOP_COMPLETED # = 5,
        # A trigger for the component to resume (after being stopped).
        RESUME # = 6,
        # A trigger when the component has successfully resumed.
        RESUME_COMPLETED # = 7,
        # A trigger for the component to reset.
        RESET # = 8,
        # A trigger when the component has successfully reset.
        RESET_COMPLETED # = 9,
        # A trigger for the component to dispose and release resources.
        DISPOSE # = 10,
        # A trigger when the component has successfully disposed.
        DISPOSE_COMPLETED # = 11,
        # A trigger for the component to degrade.
        DEGRADE # = 12,
        # A trigger when the component has successfully degraded.
        DEGRADE_COMPLETED # = 13,
        # A trigger for the component to fault.
        FAULT # = 14,
        # A trigger when the component has successfully faulted.
        FAULT_COMPLETED # = 15,

    # The log color for log messages.
    cpdef enum LogColor:
        # The default/normal log color.
        NORMAL # = 0,
        # The green log color, typically used with [`LogLevel::Info`] log levels and associated with success events.
        GREEN # = 1,
        # The blue log color, typically used with [`LogLevel::Info`] log levels and associated with user actions.
        BLUE # = 2,
        # The magenta log color, typically used with [`LogLevel::Info`] log levels.
        MAGENTA # = 3,
        # The cyan log color, typically used with [`LogLevel::Info`] log levels.
        CYAN # = 4,
        # The yellow log color, typically used with [`LogLevel::Warning`] log levels.
        YELLOW # = 5,
        # The red log color, typically used with [`LogLevel::Error`] or [`LogLevel::Critical`] log levels.
        RED # = 6,

    # The log level for log messages.
    cpdef enum LogLevel:
        # The **DBG** debug log level.
        DEBUG # = 10,
        # The **INF** info log level.
        INFO # = 20,
        # The **WRN** warning log level.
        WARNING # = 30,
        # The **ERR** error log level.
        ERROR # = 40,
        # The **CRT** critical log level.
        CRITICAL # = 50,

    cdef struct LiveClock:
        pass

    # Provides a high-performance logger utilizing a MPSC channel under the hood.
    #
    # A separate thead is spawned at initialization which receives [`LogEvent`] structs over the
    # channel.
    cdef struct Logger_t:
        pass

    # Provides a generic message bus to facilitate various messaging patterns.
    #
    # The bus provides both a producer and consumer API for Pub/Sub, Req/Rep, as
    # well as direct point-to-point messaging to registered endpoints.
    #
    # Pub/Sub wildcard patterns for hierarchical topics are possible:
    #  - `*` asterisk represents one or more characters in a pattern.
    #  - `?` question mark represents a single character in a pattern.
    #
    # Given a topic and pattern potentially containing wildcard characters, i.e.
    # `*` and `?`, where `?` can match any single character in the topic, and `*`
    # can match any number of characters including zero characters.
    #
    # The asterisk in a wildcard matches any character zero or more times. For
    # example, `comp*` matches anything beginning with `comp` which means `comp`,
    # `complete`, and `computer` are all matched.
    #
    # A question mark matches a single character once. For example, `c?mp` matches
    # `camp` and `comp`. The question mark can also be used more than once.
    # For example, `c??p` would match both of the above examples and `coop`.
    cdef struct MessageBus_PyObject:
        pass

    cdef struct TestClock:
        pass

    # Provides a C compatible Foreign Function Interface (FFI) for an underlying [`TestClock`].
    #
    # This struct wraps `TestClock` in a way that makes it compatible with C function
    # calls, enabling interaction with `TestClock` in a C environment.
    #
    # It implements the `Deref` trait, allowing instances of `TestClock_API` to be
    # dereferenced to `TestClock`, providing access to `TestClock`'s methods without
    # having to manually access the underlying `TestClock` instance.
    cdef struct TestClock_API:
        TestClock *_0;

    # Provides a C compatible Foreign Function Interface (FFI) for an underlying [`LiveClock`].
    #
    # This struct wraps `LiveClock` in a way that makes it compatible with C function
    # calls, enabling interaction with `LiveClock` in a C environment.
    #
    # It implements the `Deref` and `DerefMut` traits, allowing instances of `LiveClock_API` to be
    # dereferenced to `LiveClock`, providing access to `LiveClock`'s methods without
    # having to manually access the underlying `LiveClock` instance. This includes
    # both mutable and immutable access.
    cdef struct LiveClock_API:
        LiveClock *_0;

    # Provides a C compatible Foreign Function Interface (FFI) for an underlying [`Logger`].
    #
    # This struct wraps `Logger` in a way that makes it compatible with C function
    # calls, enabling interaction with `Logger` in a C environment.
    #
    # It implements the `Deref` trait, allowing instances of `Logger_API` to be
    # dereferenced to `Logger`, providing access to `Logger`'s methods without
    # having to manually access the underlying `Logger` instance.
    cdef struct Logger_API:
        Logger_t *_0;

    # Provides a C compatible Foreign Function Interface (FFI) for an underlying [`MessageBus`].
    #
    # This struct wraps `MessageBus` in a way that makes it compatible with C function
    # calls, enabling interaction with `MessageBus` in a C environment.
    #
    # It implements the `Deref` trait, allowing instances of `MessageBus_API` to be
    # dereferenced to `MessageBus`, providing access to `TestClock`'s methods without
    # having to manually access the underlying `MessageBus` instance.
    cdef struct MessageBus_API:
        MessageBus_PyObject *_0;

    # Represents a time event occurring at the event timestamp.
    cdef struct TimeEvent_t:
        # The event name.
        char* name;
        # The event ID.
        UUID4_t event_id;
        # The message category
        uint64_t ts_event;
        # The UNIX timestamp (nanoseconds) when the object was initialized.
        uint64_t ts_init;

    # Represents a time event and its associated handler.
    cdef struct TimeEventHandler_t:
        # The event.
        TimeEvent_t event;
        # The event ID.
        PyObject *callback_ptr;

    const char *component_state_to_cstr(ComponentState value);

    # Returns an enum from a Python string.
    #
    # # Safety
    # - Assumes `ptr` is a valid C string pointer.
    ComponentState component_state_from_cstr(const char *ptr);

    const char *component_trigger_to_cstr(ComponentTrigger value);

    # Returns an enum from a Python string.
    #
    # # Safety
    # - Assumes `ptr` is a valid C string pointer.
    ComponentTrigger component_trigger_from_cstr(const char *ptr);

    const char *log_level_to_cstr(LogLevel value);

    # Returns an enum from a Python string.
    #
    # # Safety
    # - Assumes `ptr` is a valid C string pointer.
    LogLevel log_level_from_cstr(const char *ptr);

    const char *log_color_to_cstr(LogColor value);

    # Returns an enum from a Python string.
    #
    # # Safety
    # - Assumes `ptr` is a valid C string pointer.
    LogColor log_color_from_cstr(const char *ptr);

    TestClock_API test_clock_new();

    void test_clock_drop(TestClock_API clock);

    # # Safety
    #
    # - Assumes `callback_ptr` is a valid `PyCallable` pointer.
    void test_clock_register_default_handler(TestClock_API *clock, PyObject *callback_ptr);

    void test_clock_set_time(TestClock_API *clock, uint64_t to_time_ns);

    double test_clock_timestamp(TestClock_API *clock);

    uint64_t test_clock_timestamp_ms(TestClock_API *clock);

    uint64_t test_clock_timestamp_us(TestClock_API *clock);

    uint64_t test_clock_timestamp_ns(TestClock_API *clock);

    PyObject *test_clock_timer_names(const TestClock_API *clock);

    uintptr_t test_clock_timer_count(TestClock_API *clock);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    # - Assumes `callback_ptr` is a valid `PyCallable` pointer.
    void test_clock_set_time_alert_ns(TestClock_API *clock,
                                      const char *name_ptr,
                                      uint64_t alert_time_ns,
                                      PyObject *callback_ptr);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    # - Assumes `callback_ptr` is a valid `PyCallable` pointer.
    void test_clock_set_timer_ns(TestClock_API *clock,
                                 const char *name_ptr,
                                 uint64_t interval_ns,
                                 uint64_t start_time_ns,
                                 uint64_t stop_time_ns,
                                 PyObject *callback_ptr);

    # # Safety
    #
    # - Assumes `set_time` is a correct `uint8_t` of either 0 or 1.
    CVec test_clock_advance_time(TestClock_API *clock, uint64_t to_time_ns, uint8_t set_time);

    void vec_time_event_handlers_drop(CVec v);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    uint64_t test_clock_next_time_ns(TestClock_API *clock, const char *name_ptr);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    void test_clock_cancel_timer(TestClock_API *clock, const char *name_ptr);

    void test_clock_cancel_timers(TestClock_API *clock);

    LiveClock_API live_clock_new();

    void live_clock_drop(LiveClock_API clock);

    double live_clock_timestamp(LiveClock_API *clock);

    uint64_t live_clock_timestamp_ms(LiveClock_API *clock);

    uint64_t live_clock_timestamp_us(LiveClock_API *clock);

    uint64_t live_clock_timestamp_ns(LiveClock_API *clock);

    # Creates a new logger.
    #
    # # Safety
    #
    # - Assumes `trader_id_ptr` is a valid C string pointer.
    # - Assumes `machine_id_ptr` is a valid C string pointer.
    # - Assumes `instance_id_ptr` is a valid C string pointer.
    # - Assumes `directory_ptr` is a valid C string pointer or NULL.
    # - Assumes `file_name_ptr` is a valid C string pointer or NULL.
    # - Assumes `file_format_ptr` is a valid C string pointer or NULL.
    # - Assumes `component_levels_ptr` is a valid C string pointer or NULL.
    Logger_API logger_new(const char *trader_id_ptr,
                          const char *machine_id_ptr,
                          const char *instance_id_ptr,
                          LogLevel level_stdout,
                          LogLevel level_file,
                          uint8_t file_logging,
                          const char *directory_ptr,
                          const char *file_name_ptr,
                          const char *file_format_ptr,
                          const char *component_levels_ptr,
                          uint8_t is_colored,
                          uint8_t is_bypassed);

    void logger_drop(Logger_API logger);

    const char *logger_get_trader_id_cstr(const Logger_API *logger);

    const char *logger_get_machine_id_cstr(const Logger_API *logger);

    UUID4_t logger_get_instance_id(const Logger_API *logger);

    uint8_t logger_is_colored(const Logger_API *logger);

    uint8_t logger_is_bypassed(const Logger_API *logger);

    # Create a new log event.
    #
    # # Safety
    #
    # - Assumes `component_ptr` is a valid C string pointer.
    # - Assumes `message_ptr` is a valid C string pointer.
    void logger_log(Logger_API *logger,
                    uint64_t timestamp_ns,
                    LogLevel level,
                    LogColor color,
                    const char *component_ptr,
                    const char *message_ptr);

    # # Safety
    #
    # - Assumes `trader_id_ptr` is a valid C string pointer.
    # - Assumes `name_ptr` is a valid C string pointer.
    MessageBus_API msgbus_new(const char *trader_id_ptr, const char *name_ptr);

    const PyObject *msgbus_endpoints(MessageBus_API bus);

    const PyObject *msgbus_topics(MessageBus_API bus);

    # # Safety
    #
    # - Assumes `endpoint_ptr` is a valid C string pointer.
    const PyObject *msgbus_get_endpoint(MessageBus_API bus, const char *endpoint_ptr);

    # # Safety
    #
    # - Assumes `pattern_ptr` is a valid C string pointer.
    CVec msgbus_get_matching_handlers(MessageBus_API bus, const char *pattern_ptr);

    void vec_msgbus_handlers_drop(CVec v);

    # # Safety
    #
    # - Assumes `name_ptr` is borrowed from a valid Python UTF-8 `str`.
    TimeEvent_t time_event_new(const char *name_ptr,
                               UUID4_t event_id,
                               uint64_t ts_event,
                               uint64_t ts_init);

    # Returns a [`TimeEvent`] as a C string pointer.
    const char *time_event_to_cstr(const TimeEvent_t *event);

    TimeEventHandler_t dummy(TimeEventHandler_t v);
